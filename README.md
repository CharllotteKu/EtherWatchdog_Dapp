# Lingnan-EthDarkness-Dapp
## 简介
Lingnan-EthDarkness项目客户端

[项目Dapp源码](https://github.com/Silence1017/Lingnan-EthDarkness-Dapp)
[项目服务端源码](https://github.com/Silence1017/Lingnan-EthDarkness-Server)

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
我们结合Geth插桩和深度学习技术实现了一个简易的智能合约漏洞检测框架。Geth插桩是指在以太坊客户端Geth源码中插入可以输出交易数据的代码段，交易操作码序列是由EVM操作码和操作数组成的序列。我们通过Geth插桩拿到每笔调用合约的交易的详细数据，而交易数据便包括了每笔交易的操作码序列，这些序列组成了训练数据集。

### 漏洞检测
我们搭建了基于CNN-BiLSTM的深度学习多分类模型，将交易操作码序列向量化并传入模型，最终检测出合约是否存在漏洞，若存在则输出哪种漏洞。目前模型能检测5种漏洞，包括Incorrect Check for Authorization、No Check after Contract Invocation、Missing the Transfer Event、Strict Check for Balance和Timestamp Dependency & Block Number Dependency。
