pragma solidity ^0.4.2;

// This contract will be the backend smart contract for the course-feedback system, to interact with our blockchain
contract CourseFeedback{

  // Store Candidates Count
  uint public studentsCount=0;
  // Store admin credentials
  address admin;
  
  modifier onlyAdmin() { 
    require (msg.sender==admin); 
    _; 
  }
  
  //structure to store candidate's details
  struct Student{
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
  mapping ( address => Feedback) public feedbackRecord;

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
  function giveFeedback (int a, int b) public {
      // requires that they are in studentsList
      // requires they have pk/password
      // requires that they haven't given feedback before
      require(voted[msg.sender]==false);
      //add to feedbackRecord
      Feedback temp = Feedback(a,b);
      feedbackRecord[msg.sender] = temp;
      // update voted
      voted[msg.sender]=true;

  }

  // check feedback
  function checkFeedback() public view returns (Feedback){
      //chekc if the student voted
      require(voted[msg.sender]== true);
      //check feedbackRecord
      return feedbackRecord[msg.sender];
      
  }


}
