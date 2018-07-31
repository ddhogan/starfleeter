class Crew {
    constructor(crewJson) {
        this.id = crewJson.id;
        this.name = crewJson.name;
        this.rank = crewJson.rank;
        this.specialty = crewJson.specialty;
        this.clearance = crewJson.clearance;
    };
};

function getCrews() {
    let crewList = document.querySelector("#listArea");
    let crewUl = document.createElement("ul");
    crewUl.setAttribute("id", "crewList");
    crewList.innerHTML = "<h4>All Personnel</h4>";
    crewList.appendChild(crewUl);

    const requestUrl = "/crews";
    const request = new XMLHttpRequest();

    request.open('GET', requestUrl);
    request.responseType = 'json';
    request.send();
    request.onload = function() {
        request.response.forEach(function(item) {
            let crew = new Crew(item);
            let crewLi = document.createElement("li");
            crewLi.textContent = crew.name;
            crewUl.appendChild(crewLi);
        });
    };
};