// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

// import an external contract into this contract
import "./GradeStorage.sol";

// this contract inherits the imported contract
contract GradeFactory is GradeStorage {

    // array is created to store the contracts
    GradeStorage[] public gradeStorageArray;
    
    // public function to deploy the grade storage contract
    // object of the grade storage contract created with no params
    // functions adds to the grade storage array
    function createGradeFactory() public {
        GradeStorage gradeStorage = new GradeStorage();
        gradeStorageArray.push(gradeStorage);
    }
    
    // public function to store a grade on a contract
    function storeGradeFactory(uint256 _index, uint256 _grade) public {
        GradeStorage(address(gradeStorageArray[_index])).storeGrade(_grade);
    }
    
    // function to allow the entering of an index and return the grade
    function getGradeFactory(uint256 _index) public view returns (uint256) {
        return GradeStorage(address(gradeStorageArray[_index])).readGrade();
    }
}
