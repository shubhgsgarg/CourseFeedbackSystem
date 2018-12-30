pragma solidity ^0.4.2;


contract CourseFeedback{

  // Store Candidates Count
  uint public studentsCount=0;
  // Store admin credentials

  //structure to store candidate's details
  struct Feedback{
    uint studentID;
    string studentname;
    //feedback
  }


  // mapping of all the students :studentsList
  mapping ( => ) studentsList;
  // mapping of hashes of pk/password with public key :passDB
  mapping ( => ) passDB;
  //voted
  mapping (  =>  ) public voted;
  //mapping to store feedback
  mapping (  =>  ) public feedbackRecord;

  //constructor
  constructor () public {
    //initialise admin credentials
  }

  //add students
  function addStudent () public {
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


}
