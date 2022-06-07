//SPDX-License-Identifier: MIT
pragma solidity >=0.8.12;

contract Stackoverflow {
    address public adminAddress;

    constructor() {
        adminAddress = msg.sender;
    }

    uint256 public globalQuestionID = 0;
    uint256 public globalAnsID = 0;

    struct VoteStruct {
        int256 upvote;
        int256 downvote;
    }
    struct AnswerStruct {
        uint256 id;
        uint256 questionId;
        uint256 date;
        string answer;
        // string[] tags;
        address replayer;
        VoteStruct vote;
    }

    struct QuestionStruct {
        uint256 id;
        address asker;
        uint256 date;
        string heading;
        string question;
        string[] tags;
        AnswerStruct[] answersArray;
        VoteStruct vote;
    }

    // mapping(uint256 => QuestionStruct) public questions;
    QuestionStruct[] public questions;

    function askQuestion(
        string memory qsHead,
        string memory qsCont,
        string[] memory qsTag
    ) external returns (uint256) {
        globalQuestionID++;

        // AnswerStruct[] memory answers;
        VoteStruct memory votesOfQuestion = VoteStruct(0, 0);
        questions.push(
            QuestionStruct(
                // questions[globalQuestionID] = QuestionStruct(
                globalQuestionID,
                msg.sender,
                block.timestamp,
                qsHead,
                qsCont,
                qsTag,
                new AnswerStruct[](0),
                votesOfQuestion
                // );
            )
        );
        return globalQuestionID;
    }

    function answerQuestion(uint256 _qsID, string memory _ans)
        external
    // string[] memory tags
    {
        questions[_qsID].answersArray.push(
            AnswerStruct(
                globalAnsID++,
                globalQuestionID,
                block.timestamp,
                _ans,
                // tags,
                msg.sender,
                VoteStruct(0, 0)
            )
        );
    }
}
