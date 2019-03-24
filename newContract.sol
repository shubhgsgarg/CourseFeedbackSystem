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

    struct Student{
    uint studentID;
    string studentname;
    bool hasVotedOrNot;
    }

    //Store the Feedback received from the form
    struct Feedback {
        uint q1;
        uint q2;
        //Question variables go here
    }

    //constructor
    constructor() public {
        //initialise admin credentials
        admin=msg.sender;
        setNumberOfStudents(0);
        addStudent(1,"Shubham",web3.eth.account[1]);
        addStudent(2,"Atharv",web3.eth.account[2]);
    }

    function setNumberOfStudents (uint numberOfStudents) onlyAdmin public{
        //sets the number of students allowed to give reviews
        studentsCount=numberOfStudents;
    }
}