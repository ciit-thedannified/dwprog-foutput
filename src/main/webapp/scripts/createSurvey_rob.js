var questionCount = 0;

function addQuestion() {
    questionCount++;
    document.getElementById("questionCount").value = questionCount;
    var questionDiv = document.createElement("div");
    questionDiv.className = "question";

    var questionHeader = document.createElement("h3");
    questionHeader.textContent = "Question " + questionCount;

    var questionTypeLabel = document.createElement("label");
    questionTypeLabel.setAttribute("for", "questionType_" + questionCount);
    questionTypeLabel.textContent = "Question Type:";

    var questionTypeSelect = document.createElement("select");
    questionTypeSelect.setAttribute("name", "questionType_" + questionCount)
    questionTypeSelect.id = `questionType_${questionCount}`
    questionTypeSelect.className = "questionType";
    questionTypeSelect.required = true;

    var questionTypes = [
        { value: "", label: "-- Select Question Type --" },
        { value: "shortAnswer", label: "Short Answer (Text field)" },
        { value: "paragraph", label: "Paragraph (Text area)" },
        { value: "checkbox", label: "Checkbox (Checkboxes)" },
        { value: "dropdown", label: "Dropdown (Combobox)" },
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
    questionLabel.textContent = "Question:";

    var questionInput = document.createElement("input");
    questionInput.setAttribute("type", "text");
    questionInput.setAttribute("name", "question_" + questionCount);
    questionInput.setAttribute("id", "question_" + questionCount);
    questionInput.required = true;

    var inputFieldsDiv = document.createElement("div");
    inputFieldsDiv.className = "inputFields";

    questionDiv.appendChild(questionHeader);
    questionDiv.appendChild(questionTypeLabel);
    questionDiv.appendChild(questionTypeSelect);
    questionDiv.appendChild(document.createElement("br"));
    questionDiv.appendChild(questionLabel);
    questionDiv.appendChild(questionInput);
    questionDiv.appendChild(document.createElement("br"));
    questionDiv.appendChild(inputFieldsDiv);

    var form = document.getElementById("questionForm");
    form.insertBefore(questionDiv, form.lastElementChild.previousElementSibling);

    questionTypeSelect.addEventListener("change", function () {
        showInputFields(questionTypeSelect.value, inputFieldsDiv);
    });
}

function showInputFields(selectedType, inputFieldsDiv) {
    inputFieldsDiv.innerHTML = "";

    if (selectedType === "checkbox" || selectedType === "dropdown" || selectedType === "radioGroup") {
        var addOptionButton = document.createElement("button");
        addOptionButton.type = "button";
        addOptionButton.textContent = "Add Option";
        addOptionButton.onclick = function () {
            addOption(inputFieldsDiv, selectedType);
        };

        inputFieldsDiv.appendChild(addOptionButton);
    }
}

function addOption(inputFieldsDiv, optionType) {
    var optionCount = inputFieldsDiv.getElementsByTagName("input").length + 1;

    var newOptionLabel = document.createElement("label");
    newOptionLabel.setAttribute("for", optionType + optionCount);
    newOptionLabel.textContent = "Option " + optionCount + ":";

    var newOptionInput = document.createElement("input");
    newOptionInput.setAttribute("type", "text");
    newOptionInput.setAttribute("name", optionType + optionCount);
    newOptionInput.setAttribute("id", optionType + optionCount);
    newOptionInput.className = optionType + optionCount;
    newOptionInput.required = true;

    inputFieldsDiv.appendChild(document.createElement("br"));
    inputFieldsDiv.appendChild(newOptionLabel);
    inputFieldsDiv.appendChild(newOptionInput);
}
