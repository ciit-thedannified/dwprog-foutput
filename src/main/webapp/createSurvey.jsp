<%@ page import="java.util.Optional" %>
<%@ page import="ciit.dwprog.foutput.util.Database" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Survey Creator</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
			<link rel="stylesheet" href="scripts/style.css" type="text/css">
 <style>
.tb2 {
    background-color:white;
    
    border:2px solid black;
    

   }

   th{
    height: 500px;
    width: 400px;
   
   }
   
   
   .ab1, .h4 {
   
   font: 20px Arial;
   color: black;
   font-weight: bold;
  
   
   
   }
   .ab2 {
   
    font: 12px Arial;
    font-weight: bold;
    letter-spacing: 2px;
    color: black;

   }
   
   .ab3{
   
      font: 12px Arial;
      font-weight: lighter;
      letter-spacing: 2px;
      color: black;
      opacity: 0.67;
    }
    .ab3:hover{
   
      font: 12px Arial;
      font-weight: lighter;
      letter-spacing: 2px;
      color: #fff;
      opacity: 1;
    }
    
  .qi, .questionType , .radioGroup , .checkbox {
  
    border: 1px solid black;
    font: 12px Arial;
     color:rgb(0, 0, 0);
    letter-spacing: 1px;
    font-weight: lighter;
    background: transparent;
	margin: 10px;
    width: 300px;
     text-align:center;
    
    
    
    }
    .pw {
   
      font: 14px Arial;
      color: white;
      letter-spacing: 1px;
      font-weight: lighter;
      background: transparent;
      border: none;
      width: 270px;
      text-align:center;
      
      
      }
      
      .butlog{

        background-color: white;
        border: 1px solid black;
        color: black;
        width:300px;
        padding: 5px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border-radius: 5px;

        
      }
      .butlog:hover {
      
      	background-color: black;
        border: none;
        color: white;
        border: 1px solid white;
        width:300px;
        padding: 5px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border-radius: 5px;
      
             
             
     
           }
           
           
           
        .butshow  {
    	background-image: url("trash.png");
  		background-position:bottom;
   		background-size: cover;
  		 border: none;
 		
    	margin-top:5px;
    	padding: 5px 5px;
   		height:10px;
   		width: 10px;
      }

      .butshow:hover {
      
       opacity: 1;
       box-shadow: 0 0 80px black;
            
            
    
          }
           
           
        .ob{

        background-color: white;
        border: 1px solid black;
        color: black;
        width:200px;
        padding: 3px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border-radius: 5px;

        
      }
      .ob:hover {
      
      background-color: black;
        border: none;
        color: white;
        border: 1px solid white;
        width:200px;
        padding: 3px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border-radius: 5px;
      
             
             
     
           }
           
           
        .question {
           
        font-family: Arial, Helvetica, sans-serif;
        font-weight:bold;
        font-size:15px;
        color:#edebeb;
           
           
           }
           
            .line {
            width: 300px;
            border: 3px solid black;
        }
</style>
</head>
<body class="mbody">
          <h1 class="mtext">&nbsp;Welcome!</h1>
          <%@ include file = "scripts/header.html" %>
         
    <center> 
  
    <table class="tb2">   
    <tr>
    <th> 
    <center> 


    <br><br>
    <p class="ab1">Survey Creator</p>
    <br>
    <hr class="line" width="300px"  >
 	<button type="button" onclick="addQuestion()" id="add_trigger" class="butlog">Add Question</button>
    <form id="questionForm" action="<%= request.getParameter("id") != null ? "./editing_form.jsp " : "./creating_form.jsp" %>" method="post">
        <input type="hidden" id="questionCount" name="questionCount" value="0">
        <br>
        <input type="submit" value="Submit" class="butlog">
    </form><br>
 	<button type="button" onclick="addQuestion()" class="butlog">Add Question</button>
 	 <hr class="line" width="300px" >
 	<br>
 	<br>
 	</th>
 	</tr>
 	</table>
 	<br>
 	<br>
 	
 	
    <script>
        var questionCount = 0;
        var questionForm = document.getElementById("questionForm")
        var addQuestionButton = document.getElementById("add_trigger")
        var currentFormState = <%= request.getParameter("id") != null ? Database.getQuestionsJson(Integer.parseInt(request.getParameter("id"))) : null %>

        function addQuestion() {
            questionCount++;
            document.getElementById("questionCount").value = questionCount;
            var questionDiv = document.createElement("div");
            questionDiv.className = "question";
            
            var hrElement = document.createElement("hr");
            hrElement.setAttribute("style", "width: 300px; border: 3px solid black;");
        	

            var questionHeader = document.createElement("h4");
            questionHeader.textContent = "Survey " + questionCount;
            questionHeader.className = "ab2";

            var questionTypeLabel = document.createElement("label");
            questionTypeLabel.setAttribute("for", "questionType_" + questionCount);
            questionTypeLabel.className="ab2";
            questionTypeLabel.textContent = "Survey Type:";

            var questionTypeSelect = document.createElement("select");
            questionTypeSelect.setAttribute("name", "questionType_" + questionCount);
            questionTypeSelect.className = "questionType";
            questionTypeSelect.required = true;
            

            var questionTypes = [
  
                { value: "paragraph", label: "Paragraph (Text area)" },
                { value: "checkbox", label: "Checkbox (Checkboxes)" },
                { value: "radioGroup", label: "Radio Group (Radio Buttons)" }
            ];

            for (var i = 0; i < questionTypes.length; i++) {
                var option = document.createElement("option");
                option.value = questionTypes[i].value;
                option.textContent = questionTypes[i].label;
                questionTypeSelect.appendChild(option);
            }

            var questionLabel = document.createElement("label");
            questionLabel.setAttribute("for", "question_" + questionCount);
            questionLabel.className="ab2";
            questionLabel.textContent = "Survey:";

            var questionInput = document.createElement("input");
            questionInput.setAttribute("type", "text");
            questionInput.setAttribute("name", "question_" + questionCount);
            questionInput.setAttribute("id", "question_" + questionCount);
			questionInput.className = "qi";
            questionInput.required = true;

            var inputFieldsDiv = document.createElement("div");
            inputFieldsDiv.className = "inputFields";
            
            var removeQuestionButton = document.createElement("button");
            removeQuestionButton.type = "button";
            removeQuestionButton.textContent = "";
            removeQuestionButton.className = "butshow";
            removeQuestionButton.onclick = function () {
                questionDiv.remove();
                questionCount--;
            };
            questionDiv.appendChild(removeQuestionButton);
            
            questionDiv.appendChild(document.createElement("br"));
            questionDiv.appendChild(document.createElement("br"));
            questionDiv.appendChild(questionHeader);
            questionDiv.appendChild(questionTypeLabel);
            questionDiv.appendChild(document.createElement("br"));
            questionDiv.appendChild(questionTypeSelect);
            questionDiv.appendChild(document.createElement("br"));
            questionDiv.appendChild(questionLabel);
            questionDiv.appendChild(document.createElement("br"));
            questionDiv.appendChild(questionInput);
            questionDiv.appendChild(document.createElement("br"));
            questionDiv.appendChild(inputFieldsDiv);
            questionDiv.appendChild(hrElement);

            var form = document.getElementById("questionForm");
            form.insertBefore(questionDiv, form.lastElementChild.previousElementSibling);

            questionTypeSelect.addEventListener("change", function () {
                showInputFields(questionTypeSelect.value, inputFieldsDiv);
            });

            questionTypeSelect.addEventListener("click", function () {
                showInputFields(questionTypeSelect.value, inputFieldsDiv);
            });

        }

        function showInputFields(selectedType, inputFieldsDiv) {
            inputFieldsDiv.innerHTML = "";

            if (selectedType === "checkbox" || selectedType === "radioGroup") {
                var addOptionButton = document.createElement("button");
                addOptionButton.type = "button";
                addOptionButton.textContent = "Add Options";
                addOptionButton.className = "ob";
                addOptionButton.onclick = function () {
                    addOption(inputFieldsDiv, selectedType);
                };
                inputFieldsDiv.appendChild(document.createElement("br"));
                inputFieldsDiv.appendChild(addOptionButton);
                inputFieldsDiv.appendChild(document.createElement("br"));
            }
        }

        function addOption(inputFieldsDiv, optionType) {
            var optionCount = inputFieldsDiv.getElementsByTagName("input").length + 1;

            var newOptionLabel = document.createElement("label");
            newOptionLabel.setAttribute("for", optionType + optionCount);
            newOptionLabel.className="ab2";
            newOptionLabel.textContent = "Options " + optionCount + ":";

            var newOptionInput = document.createElement("input");
            newOptionInput.setAttribute("type", "text");
            newOptionInput.setAttribute("name", optionType + optionCount);
            newOptionInput.className = optionType;
            newOptionInput.setAttribute("id", optionType + optionCount);
            newOptionInput.required = true;

            var removeOptionButton = document.createElement("button");
            removeOptionButton.type = "button";
            removeOptionButton.textContent = "";
            removeOptionButton.className = "butshow";
            removeOptionButton.onclick = function () {
                newOptionLabel.remove();
                newOptionInput.remove();
                removeOptionButton.remove();
                br1.remove();
                br2.remove();
                br3.remove();
            };

            var br1 = document.createElement("br");
            var br2 = document.createElement("br");
            var br3 = document.createElement("br");

            inputFieldsDiv.appendChild(br1);
            inputFieldsDiv.appendChild(removeOptionButton);
            inputFieldsDiv.appendChild(br2);
            inputFieldsDiv.appendChild(newOptionLabel);
            inputFieldsDiv.appendChild(br3);
            inputFieldsDiv.appendChild(newOptionInput);

        }

        questionForm.addEventListener("submit", event => {
            event.preventDefault()
            let questions = questionForm.querySelectorAll(".question");

            let questionsArray = [];

            questions.forEach((k,v) => {
                let questionType = k.getElementsByClassName("questionType")[0].value;
                let questionPrompt = k.getElementsByClassName("qi")[0].value;
                let questionOptions = k.getElementsByClassName(questionType);
                let currentElement = questionsArray[questionsArray.length] = {
                    "type" : questionType,
                    "prompt" : questionPrompt,
                    "options" : []
                }

                if (questionType === "paragraph") {
                    delete currentElement.options;
                }
                else {
                    for (let opt of questionOptions) {
                        let x = currentElement.options
                        x[x.length] = opt.value;
                    }
                }

            });

            let json = JSON.stringify(questionsArray);

            console.log(json)

            let formdata = document.createElement("input")
            formdata.hidden = true;
            formdata.value = json;
            formdata.name = "formdata";

            var id = <%= request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : null %>

            if (id !== null) {
                let surveyId = document.createElement("input");
                surveyId.hidden = true;
                surveyId.value = id;
                surveyId.name = "id";
                questionForm.append(surveyId)
            }

            questionForm.append(formdata);
            questionForm.submit();

        })

        if (currentFormState !== null) {

            let questions;

            for (let i = 0; i < currentFormState.length; i++) {
                addQuestionButton.click();
            }

            questions = questionForm.querySelectorAll(".question");

            questions.forEach((k, v) => {
                let type = k.querySelector(".questionType");
                let prompt = k.querySelector(".qi");
                let currentQuestion = currentFormState[v];

                prompt.value = currentQuestion.prompt;

                if (currentQuestion.type !== "paragraph") {
                    type.value = currentQuestion.type;
                    type.click();

                    let optionButton = k.querySelector(".ob");
                    let inputFields;

                    for (let i = 0; i < currentQuestion.options.length; i++) {
                        optionButton.click();
                        inputFields = k.querySelectorAll("." + currentQuestion.type);
                        inputFields[i].value = currentQuestion.options[i];
                    }
                }
            })

        }

    </script>
</body>
</html>
