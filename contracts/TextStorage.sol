pragma solidity ^0.8.0;

contract TextStorage {
    address private owner;  // 合约所有者的地址
    string private storedText;  // 存储的文本信息
    
    // 事件，当文本信息被更新时触发
    event TextUpdated(address indexed user, string newText);

    // 构造函数，设置合约所有者为部署合约的用户
    constructor() {
        owner = msg.sender;
    }

    // 修改器，限制只有合约所有者才能调用
    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this function");
        _;
    }

    // 设置存储的文本信息，只有指定用户才能调用
    function setText(string memory _text) public {
        require(msg.sender == owner, "Only specified user can call this function");
        storedText = _text;
        emit TextUpdated(msg.sender, _text);
    }

    // 获取存储的文本信息
    function getText() public view returns (string memory) {
        return storedText;
    }

    // 合约所有者可以修改指定用户的地址
    function setOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
}
