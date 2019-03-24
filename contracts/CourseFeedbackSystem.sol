pragma solidity >=0.4.21 <0.6.0;

// This contract will be the backend smart contract for the course-feedback system, to interact with our blockchain
contract CourseFeedback{


  // Store students Count
  uint public studentsCount;
  //Store number of students who have voted till now
  uint numberOfVotedStudents=0;
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
    bool validStud;
    //feedback
  }

  //Store the Feedback received from the form
  struct Feedback {
    uint q1;
    uint q2;
    //Question variables go here
  }


  //Mappings
  // mapping of all the students :studentsList
  mapping (address=>Student) studentsList;
  // mapping of hashes of pk/password with public key :passDB
  //mapping ( => ) passDB;
  //voted
  mapping (address=>bool) public voted;
  //mapping to store feedback
  mapping ( address => Feedback) public feedbackRecord;


  //constructor
  constructor() public {
    //initialise admin credentials
    admin=msg.sender;
    setNumberOfStudents(0);
    addStudent(1,"Shubham",0xDF824dFb10e5E9089DcaA89c62111F75814F9C4a);
    addStudent(2,"Atharv",0x26f5051531dC81F0108389e5b32755366Eff1C6f);

  }


  function setNumberOfStudents (uint numberOfStudents) onlyAdmin public{
    //sets the number of students allowed to give reviews
    studentsCount=numberOfStudents;
  }


  //add students
  function addStudent (uint _studentid,string memory _studentname, address pk) onlyAdmin public {
    //making a new student struct
    studentsList[pk]=Student(_studentid,_studentname,true);
    //add to studentsList

    //update passDB
    //increase numberOfVotedStudents
    studentsCount++;
  }



  //give feedback
  function giveFeedback (uint a, uint b) public {
      // requires that they are in studentsList
      require(studentsList[msg.sender].validStud=true);
      // requires they have pk/password
      // requires that they haven't given feedback before
      require(voted[msg.sender]==false);

      //add to feedbackRecord
      feedbackRecord[msg.sender] = Feedback(a,b);
      // update voted
      voted[msg.sender]=true;
  }


  // check feedback
  function checkFeedback() public view returns (uint, uint){
      //chekc if the student voted
      require(voted[msg.sender]== true);
      //check feedbackRecord
      return (feedbackRecord[msg.sender].q1,feedbackRecord[msg.sender].q2);

  }

  function getNoOfStudVoted() public returns (uint)
  {
    return numberOfVotedStudents;
  }

  function getTotalStud() public returns (uint)
  {
    return studentsCount;
  }

}