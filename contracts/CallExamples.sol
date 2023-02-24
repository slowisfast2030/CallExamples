pragma solidity ^0.4.22;

contract calledContract {
    event callEvent(address sender, address origin, address from);
    function calledFunction() public {
        emit callEvent(msg.sender, tx.origin, this);
    }
}


library calledLibrary {
    event callEvent(address sender, address origin,  address from);
    function calledFunction() public {
        emit callEvent(msg.sender, tx.origin, this);
    }
}


// 疑问：记得在METoken这个合约中需要使用openZeppelin的ERC20代码，里面包含了一些库和一些类。但是在部署阶段，只部署了METoken合约。
contract caller {
    // 这一步非常奇怪。这里明明传入的calledContract的一个实例。但是在truffle console进行调用的时候传入的却是calledContract的地址。而且，传入实例会报错。
    function make_calls(calledContract _calledContract) public {

    // Calling calledContract and calledLibrary directly
    _calledContract.calledFunction(); // 传入的是calledContract合约实例，通过实例调用合约函数
    calledLibrary.calledFunction(); // 直接把library当做一个命名空间

    // Low-level calls using the address object for calledContract
    require(address(_calledContract).
            call(bytes4(keccak256("calledFunction()"))));
    require(address(_calledContract).
            delegatecall(bytes4(keccak256("calledFunction()"))));



	}
}
