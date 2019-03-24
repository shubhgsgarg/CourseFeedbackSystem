pragma solidity >=0.4.21 <0.6.0;

// This contract will be the backend smart contract for the course-feedback system, to interact with our blockchain
contract CourseFeedback{

    // Store students Count
    uint public studentsCount;
    //Store number of students who have voted till now
    uint numberOfVotedStudents=0;
    // Store admin credentials
    address admin;

    //Modifier which allows only the admin to perform certain tasks
    modifier onlyAdmin() {
        require (msg.sender==admin);
        _;
    }

    //structure to store candidate's details
    struct Student{
    uint studentID;
    string studentname;
    bool validStud;
    bool hasVoted;
    }

    //Store the Feedback received from the form
    struct Feedback {
        uint q1;
        uint q2;
        //Question variables go here
    }

    //Mappings
    // mapping of all the students :studentsList
    mapping (address=>Student) internal studentsList;
    //voted
    mapping (address=>bool) public voted;


    //constructor
    constructor() public {
        //initialise admin credentials
        admin=msg.sender;
        setNumberOfStudents(0);
        addStudent(1,"Shubham",web3.eth.account[1]);
        addStudent(2,"Atharv",web3.eth.account[2]);
    }


    function addStudent (uint _studentid,string memory _studentname) onlyAdmin public {
      //add to studentsList
      studentsList[msg.sender]=Student(_studentid,_studentname,true);
      //increase studentsCount
      studentsCount++;
    }

    function giveFeedback (uint a, uint b) public returns(uint) {
        // requires that they are in studentsList
        require(studentsList[msg.sender].validStud=true);
        // requires that they haven't given feedback before
        require(voted[msg.sender]==false);


    }


}
