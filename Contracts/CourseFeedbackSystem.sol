pragma solidity ^0.4.2;


contract CourseFeedback{

    // Store Candidates Count
  uint public candidatesCount=0;


    //structure to store candidate's details
  struct Feedback{
    uint candidateID;
    string name;
    uint voteCount;
  }



  
  //voted
  mapping ( address => uint ) public voted;
  //mapping to store votes
  mapping ( uint => uint ) public record;

  //constructor
  constructor () public {

  }

  //add candidates
  function addCandidate () public {

  }


  //vote using private key        only Voter
  function vote (uint _pk, uint _candidateId) public {

      // require that they haven't voted before
      require(voted[msg.sender]!=10);

      // require a valid candidate
      require(_candidateId > 0 && _candidateId <= candidatesCount);


  }

  // check vote
  function checkVote(uint _pk) public view returns (uint){

  }


}
