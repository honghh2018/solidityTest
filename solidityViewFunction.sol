pragma solidity ^0.8.7;




contract globalVariable{
     function globalVars() external view  returns (address,uint,uint){
        address sender = msg.sender; //这个是发送者的地址   0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        uint timestamp =  block.timestamp;   //调用这个函数的uint时间戳 1752549029
        //这个块的块包
        uint blockNum =  block.number; //24
        return (sender,timestamp,blockNum);
     }
}