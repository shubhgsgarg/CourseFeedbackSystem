pragma solidity ^0.4.2;


contract CourseFeedback{

    // Store Candidates Count
  uint public studentsCount=0;


    //structure to store candidate's details
  struct Feedback{
    uint studentID;
    string studentname;

  }




  //voted
  mapping ( address => uint ) public voted;
  //mapping to store feedback
  mapping ( address => Feedback ) public feedbackRecord;

  //constructor
  constructor () public {

  }

  //add candidates
  function addStudent () public {

  }


  //give feedback using private key
  function giveFeedback () public {

      // require that they haven't given feedback before
      require();


  }

  // check feedback
  function checkFeedback(uint _pk) public view returns (uint){

  }


}
