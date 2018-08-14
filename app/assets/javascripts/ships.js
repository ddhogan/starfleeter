class Ship {
    constructor(shipJson) {
        this.id = shipJson.id;
        this.name = shipJson.name;
        this.typeClass = shipJson.type_class;
        this.warpFactor = shipJson.warp_factor;
        this.complement = shipJson.complement;
        this.note = shipJson.note;
        this.crews = shipJson.crews;
    };
};

let allShips = [];

function getShips() {
    let shipList = document.querySelector("#listArea");
    let shipUl = document.createElement("ul");
    shipUl.setAttribute("id", "shipList");
    shipList.innerHTML = "<h3>The Fleet</h3>";
    shipList.appendChild(shipUl);
    
    // clear out the moreInfo section
    let moreInfo = document.querySelector("#moreInfo");
    moreInfo.innerHTML = '<p></p>';

    const requestUrl = "/ships";
    const request = new XMLHttpRequest();
    allShips = []; // start with an empty list
    
    request.open('GET', requestUrl);
    request.responseType = 'json';
    request.send();
    request.onload = function() {
        request.response.forEach(function(item) {
            let ship = new Ship(item);
            allShips.push(ship);
            let shipLi = document.createElement("li");
            shipLi.innerHTML = 'Name: <a href="#" onclick="getShipInfo(' + ship.id + ');">' + ship.name + '</a>, Class: ' + ship.typeClass + ', Warp Factor: ' + ship.warpFactor + '<br> <div id="moreInfoSpot"></div>';
            shipUl.appendChild(shipLi);
        });
    };
    let alphaButton = document.createElement("button");
    alphaButton.innerHTML = '<button onclick="alphabetize();">Alphabetize Ships</button>';
    shipList.append(alphaButton);
};

function alphabetize() {
    let shipList = document.getElementById("shipList");
    shipList.innerText = ""; // clear out the current list
    allShips.sort(function(a, b) {
        return a.name > b.name;
    }).forEach(function(ship) {
        let shipLi = document.createElement("li");
        shipLi.innerHTML = 'Name: <a href="#" onclick="getShipInfo(' + ship.id + ');">' + ship.name + '</a>, Class: ' + ship.typeClass + ', Warp Factor: ' + ship.warpFactor + '<br> <div id="moreInfoSpot"></div>';
        document.getElementById("shipList").appendChild(shipLi);
    });
};

function getShipInfo(shipId) {
    let moreInfo = document.querySelector("#moreInfo");
    const request = new XMLHttpRequest();
    const requestUrl = "/ships/"+`${shipId}`;
    request.open('GET', requestUrl);
    request.responseType = 'json';
    request.send();
    request.onload = function() {
        let ship = new Ship(request.response);
        moreInfo.innerHTML = '<br><h3>Additional Information for '+ship.name+'</h3><p><strong>Complement: </strong>'+ship.complement+', <strong>Note: </strong>'+ship.note+'</p>';
        crewUl = document.createElement("ul")
        moreInfo.appendChild(crewUl);

        addLink = document.createElement("a");
        addLink.innerHTML = '<a href="/assignments">Manage Assignments</a>';

        if (ship.crews.length > 0) {
            ship.crews.forEach(function(crew) {
                crewLi = document.createElement("li")
                crewLi.innerHTML = '<li><strong>Assigned Crew: </strong>' +crew.name +'</li>';
                crewUl.appendChild(crewLi);
            });
            moreInfo.appendChild(addLink);
        } else {
            crewLi = document.createElement("li")
            crewLi.innerHTML = '<li>There are no crew members currently assigned to '+ship.name+'.</li>';
            crewUl.appendChild(crewLi);
            moreInfo.appendChild(addLink);
        }
    };
};