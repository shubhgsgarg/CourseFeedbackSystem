pragma solidity ^0.4.2;

// This contract will be the backend smart contract for the course-feedback system, to interact with our blockchain
contract CourseFeedback{

  // Store Candidates Count
  uint public studentsCount=0;

  // Store admin credentials
  address admin;

  //structure to store candidate's details
  struct student{
    uint studentID;
    string studentname;
    //feedback
  }

  //Store the Feedback received from the form
  struct Feedback {
    //Question variables go here
  }
  

  //Mappings
  // mapping of all the students :studentsList
  mapping (address=>student) studentsList;

  // mapping of hashes of pk/password with public key :passDB
  mapping ( => ) passDB;

  //voted
  mapping (address=>bool) public voted;

  //mapping to store feedback
  mapping ( student => Feedback) public feedbackRecord;

  //constructor
  constructor() public {
    //initialise admin credentials
  }

  function setNumberOfStudents (uint numberOfStudents) onlyAdmin {
    studentsCount=numberOfStudents;
  }
  
  //add students
  function addStudent () onlyAdmin public {
    // requires admin credentials
    //add to studentsList
    //update passDB
    //increase studentsCount
  }


  //give feedback
  function giveFeedback () public {
      // requires that they are in studentsList
      // requires they have pk/password
      // requires that they haven't given feedback before
      require();

      //add to feedbackRecord
      // update voted

  }

  // check feedback
  function checkFeedback() public view returns (uint){
      //require correct pasword/pk
      //check feedbackRecord
  }

  modifier onlyAdmin() { 
    require (msg.sender==admin); 
    _; 
  }
  
}
