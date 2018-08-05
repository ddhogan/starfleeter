class Assignment {
    constructor(assignmentJson) {
        this.id = assignmentJson.id;
        this.name = assignmentJson.name;
        this.description = assignmentJson.description;
        this.ship_id = assignmentJson.ship_id;
        this.crew_id = assignmentJson.crew_id;
    };
};

function postAssignment() {
    let myForm = document.querySelector("form")
    if (myForm) {
        myForm.onsubmit = function(event){
            event.preventDefault();

            const xhr = new XMLHttpRequest;
            const url = '/assignments';
            let token = document.querySelector('meta[name="csrf-token"]').content;
            let newAssignment = {
                name: document.querySelector("#assignment_name").value,
                description: document.querySelector("#assignment_description").value,
                ship_id: document.querySelector("#assignment_ship_id").value,
                crew_id: document.querySelector("#assignment_crew_id").value
            };
            xhr.responseType = 'json';
            xhr.onreadystatechange = () => {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    let assignmentList = document.querySelector("#assignmentList");
                    let newOne = document.createElement("li")
                    newOne.innerHTML = '<li>'+xhr.response.crew.rank+" "+xhr.response.crew.name+ ' is <a href="/ships/'+ xhr.response.ship.id + '/assignments/' + xhr.response.id +'">' + 'assigned</a> to the ' + xhr.response.ship.name + '.</li>';
                    assignmentList.appendChild(newOne);
                }
            };
            xhr.open('POST', url);
            xhr.setRequestHeader("x-csrf-token", token);
            xhr.setRequestHeader("Accept", "application/json");     
            xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
            xhr.send(JSON.stringify(newAssignment));
            myForm.reset();
        };
    };
};


window.onload = postAssignment();