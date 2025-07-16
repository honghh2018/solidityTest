
pragma solidity ^0.8.0;



contract testHelloWorld{
     string public  message ="hell world";
    //  function getMessage() public  view returns (string memory) {
        function getMessage() view public returns(string memory){ 
        return message;
     }
}



contract functionPureAndView{
    function test1Pure() public pure returns(uint){
        return 42;
    }
    function testView()public view returns(address){
        return msg.sender;
    } 

    // function testParams(string userId) public view returns(string memory){
    function testParams(string calldata userId) public view returns(string memory){
        return string.concat("user_id-",userId);
    } 

    //    function uint2str(uint _i) internal pure returns (string memory) {
    //     if (_i == 0) {
    //         return "0";
    //     }
    //     bytes memory bstr = new bytes(32);
    //     uint index = 0;
    //     while (_i > 0) {
    //         bstr[index++] = bytes1(uint8(48 + (_i % 10)));
    //         _i /= 10;
    //     }
    //     bytes memory reversed = new bytes(index);
    //     for (uint i = 0; i < index; i++) {
    //         reversed[i] = bstr[index - 1 - i];
    //     }
    //     return string(reversed);
    // }
}
