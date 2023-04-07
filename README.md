# EtherWatchdog_Dapp
## 简介
前端界面展示EtherWatchdog的三个部分————数据集、模型与检测。

1. 数据集：展示Geth插桩获取的部分交易信息，具体信息请看图示。
2. 模型：展示用于检测合约漏洞的CNN-BiLSTM多分类模型。
3. 检测：展示漏洞检测流程，用户输入待检测的交易Hash，后端返回检测结果并上链。

[Dapp源码](https://github.com/Silence1017/Lingnan-EthDarkness-Dapp)  [Server源码](https://github.com/Silence1017/Lingnan-EthDarkness-Server)

## 背景
以太坊的问世将区块链技术的发展推入以智能合约为标志的2.0时代。智能合约利用区块链去中心化的特性，将传统合同转变为代码的形式部署在区块链平台上，极大地降低了交易的成本。然而随着应用场景的丰富，智能合约控制的金融资产不可避免地成为黑客攻击的目标，其公开透明、不可篡改的特性以及与日俱增的复杂性更加剧了恶意攻击事件的发生。目前由智能合约安全漏洞引发的大规模安全案例不在少数，不仅造成了巨大的经济损失，而且严重破坏了基于区块链的信用体系，影响了用户对区块链技术的信任度和满意度。

## 环境需求
1. [MetaMask](https://metamask.io/)
2. [node](https://nodejs.org/)
3. [yarn](https://yarnpkg.com/)
4. [Ganache](https://www.trufflesuite.com/ganache)
5. [truffle](https://trufflesuite.com/truffle/) (npm install -g truffle)
6. lite-server (yarn add lite-server)

## 框架流程
### 数据集获取
我们结合Geth插桩和深度学习技术实现了一个简易的智能合约漏洞检测框架。Geth插桩是指在以太坊客户端Geth源码中插入可以输出交易数据的代码段，交易操作码序列是由EVM操作码和操作数组成的序列。我们通过Geth插桩拿到每笔调用合约的交易的信息，而交易信息便包括了每笔交易的操作码序列，这些序列组成了训练数据集。

### 漏洞检测
我们搭建了基于CNN-BiLSTM的深度学习多分类模型，将交易操作码序列向量化并传入模型，最终检测出合约是否存在漏洞，若存在则输出哪种漏洞。目前模型能检测5种漏洞，包括错误的权限检查（Incorrect Check for Authorization）、错误处理的异常（No Check after Contract Invocation）、缺少标准事件（Missing the Transfer Event）、严格余额检查（Strict Check for Balance）和时间戳/区块号依赖（Timestamp Dependency & Block Number Dependency）。

## 使用文档
### 初始化
```
truffle init
npm init
```

### 启动私链
> 打开Ganache，启动本地私链，默认生成10个有100个ETH的账户

> 查看配置端口，默认7545，可以依照需求自行更改

> 修改truffle-config.js里面的配置端口
```
development: {
     host: "127.0.0.1",     // Localhost (default: none)
     port: 7545,            // Standard Ethereum port (default: none)
     network_id: "*",       // Any network (default: none)
 }
```

### 部署合约
> 进入truffle控制台
```
truffle console
```
显示truffle(development)连接上了development环境

> 编译合约
```
compile
```
成功后有如下输出，并且项目会增加build目录，里面有编译好的ABI文件
```
> Compiled successfully using:
   - solc: 0.8.0+commit.9c3226ce.Emscripten.clang
```

> 部署合约
```
migrate
migrate --reset    // 如果合约修改了需要重新部署，则需要添加reset参数
```
成功后有如下输出
```
Summary
=======
> Total deployments:   2
> Final cost:           0.02087428 ETH

```
可以在打开的Ganache中看到区块变化, 默认花费第一个帐户的ETH
