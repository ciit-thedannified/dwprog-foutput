var questionCount = 0;

function addQuestion() {
    questionCount++;
    var questionDiv = document.createElement("div");
    questionDiv.className = "question";

    var questionHeader = document.createElement("h3");
    questionHeader.textContent = "Question " + questionCount;

    var questionTypeLabel = document.createElement("label");
    questionTypeLabel.setAttribute("for", "questionType_" + questionCount);
    questionTypeLabel.textContent = "Question Type:";

    var questionTypeSelect = document.createElement("select");
    questionTypeSelect.setAttribute("name", "questionType_" + questionCount);
    questionTypeSelect.className = "questionType";
    questionTypeSelect.setAttribute("onchange", "showInputFields(this);");
    questionTypeSelect.required = true;

    var defaultOption = document.createElement("option");
    defaultOption.value = "";
    defaultOption.textContent = "-- Select Question Type --";
    questionTypeSelect.appendChild(defaultOption);

    var shortAnswerOption = document.createElement("option");
    shortAnswerOption.value = "shortAnswer";
    shortAnswerOption.textContent = "Short Answer (Text field)";
    questionTypeSelect.appendChild(shortAnswerOption);

    var paragraphOption = document.createElement("option");
    paragraphOption.value = "paragraph";
    paragraphOption.textContent = "Paragraph (Text area)";
    questionTypeSelect.appendChild(paragraphOption);

    var checkboxOption = document.createElement("option");
    checkboxOption.value = "checkbox";
    checkboxOption.textContent = "Checkbox (Checkboxes)";
    questionTypeSelect.appendChild(checkboxOption);

    var dropdownOption = document.createElement("option");
    dropdownOption.value = "dropdown";
    dropdownOption.textContent = "Dropdown (Combobox)";
    questionTypeSelect.appendChild(dropdownOption);

    var radioGroupOption = document.createElement("option");
    radioGroupOption.value = "radioGroup";
    radioGroupOption.textContent = "Radio Group (Radio Buttons)";
    questionTypeSelect.appendChild(radioGroupOption);

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
}

function showInputFields(selectElement) {
    var questionDiv = selectElement.parentNode;
    var inputFieldsDiv = questionDiv.querySelector(".inputFields");
    inputFieldsDiv.innerHTML = "";

    if (selectElement.value === "checkbox") {
        var checkboxOptionsDiv = document.createElement("div");
        checkboxOptionsDiv.id = "checkboxOptionsDiv";

        var addOptionButton = document.createElement("button");
        addOptionButton.type = "button";
        addOptionButton.textContent = "Add Option";
        addOptionButton.onclick = addCheckboxOption;

        checkboxOptionsDiv.appendChild(addOptionButton);
        inputFieldsDiv.appendChild(checkboxOptionsDiv);
    } else if (selectElement.value === "dropdown") {
        var dropdownOptionsDiv = document.createElement("div");
        dropdownOptionsDiv.id = "dropdownOptionsDiv";

        var addOptionButton = document.createElement("button");
        addOptionButton.type = "button";
        addOptionButton.textContent = "Add Option";
        addOptionButton.onclick = addDropdownOption;

        dropdownOptionsDiv.appendChild(addOptionButton);
        inputFieldsDiv.appendChild(dropdownOptionsDiv);
    } else if (selectElement.value === "radioGroup") {
        var radioOptionsDiv = document.createElement("div");
        radioOptionsDiv.id = "radioOptionsDiv";

        var addOptionButton = document.createElement("button");
        addOptionButton.type = "button";
        addOptionButton.textContent = "Add Option";
        addOptionButton.onclick = addRadioOption;

        radioOptionsDiv.appendChild(addOptionButton);
        inputFieldsDiv.appendChild(radioOptionsDiv);
    }
}

function addCheckboxOption() {
    var checkboxOptionsDiv = document.getElementById("checkboxOptionsDiv");
    var optionCount = checkboxOptionsDiv.getElementsByTagName("input").length / 1 + 1;

    var newOptionLabel = document.createElement("label");
    newOptionLabel.setAttribute("for", "checkbox" + optionCount);
    newOptionLabel.textContent = "Option " + optionCount + ":";

    var newOptionInput = document.createElement("input");
    newOptionInput.setAttribute("type", "text");
    newOptionInput.setAttribute("name", "checkbox" + optionCount);
    newOptionInput.setAttribute("id", "checkbox" + optionCount);
    newOptionInput.required = true;

    checkboxOptionsDiv.appendChild(document.createElement("br"));
    checkboxOptionsDiv.appendChild(newOptionLabel);
    checkboxOptionsDiv.appendChild(newOptionInput);
}

function addDropdownOption() {
    var dropdownOptionsDiv = document.getElementById("dropdownOptionsDiv");
    var optionCount = dropdownOptionsDiv.getElementsByTagName("textarea").length + 1;

    var newOptionTextarea = document.createElement("textarea");
    newOptionTextarea.setAttribute("name", "dropdownOption" + optionCount);
    newOptionTextarea.setAttribute("id", "dropdownOption" + optionCount);
    newOptionTextarea.setAttribute("rows", "2");
    newOptionTextarea.setAttribute("cols", "30");
    newOptionTextarea.required = true;

    dropdownOptionsDiv.appendChild(newOptionTextarea);
}

function addRadioOption() {
    var radioOptionsDiv = document.getElementById("radioOptionsDiv");
    var optionCount = radioOptionsDiv.getElementsByTagName("input").length / 1 + 1 ;

    var newOptionLabel = document.createElement("label");
    newOptionLabel.setAttribute("for", "radio" + optionCount);
    newOptionLabel.textContent = "Option " + optionCount + ":";

    var newOptionInput = document.createElement("input");
    newOptionInput.setAttribute("type", "text");
    newOptionInput.setAttribute("name", "radio" + optionCount);
    newOptionInput.setAttribute("id", "radio" + optionCount);
    newOptionInput.required = true;

    radioOptionsDiv.appendChild(document.createElement("br"));
    radioOptionsDiv.appendChild(newOptionLabel);
    radioOptionsDiv.appendChild(newOptionInput);
}