//SPDX-License-Identifier: MIT
pragma solidity >= 0.8.12;

contract StackOverFlow{
    // constructor(){
    // }

    uint private globalQuestionID  = 0;


    struct voteStruct{
        int upvote;
        int downvote;
    }

    struct questionStruct{
        uint id;
        address asker;
        uint date;
        string heading;
        string question;
        string[] tags;
        voteStruct vote;
    }
    
    struct answerStruct{
        uint id;
        uint questionId;
        uint date;
        address replayer;
        voteStruct vote;
    }

    questionStruct[] public questions;
    
    
    function askQuestion(string memory qsHead, string memory qsCont, string[] memory qsTag) external returns(uint) {
        questions.push(
            questionStruct(
                globalQuestionID++,
                msg.sender,
                block.timestamp,
                qsHead,
                qsCont,
                qsTag,
                voteStruct(0,0)
            )
        );
        return globalQuestionID;
    }
}
