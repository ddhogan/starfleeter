class Ship {
    constructor(shipJson) {
        this.id = shipJson.id;
        this.name = shipJson.name;
        this.typeClass = shipJson.type_class;
        this.warpFactor = shipJson.warp_factor;
        this.complement = shipJson.complement;
        this.note = shipJson.note;
    };
};

function getShips() {
    let shipList = document.querySelector("#listArea");
    let shipUl = document.createElement("ul");
    shipUl.setAttribute("id", "shipList");
    shipList.innerHTML = "<h4>The Fleet</h4>";
    shipList.appendChild(shipUl);

    const requestUrl = "/ships";
    const request = new XMLHttpRequest();

    request.open('GET', requestUrl);
    request.responseType = 'json';
    request.send();
    request.onload = function() {
        request.response.forEach(function(item) {
            let ship = new Ship(item);
            let shipLi = document.createElement("li");
            shipLi.innerHTML = 'Name: <a id="'+ ship.id + '" href="#" onclick="getShipInfo();">' + ship.name + '</a>, Class: ' + ship.typeClass + ', Warp Factor: ' + ship.warpFactor;
            // shipLi.textContent = ship.name;
            shipUl.appendChild(shipLi);
        });
    };
};

function getShipInfo() {
    let shipLi = document.querySelector("#shipList li a");
    shipLi.addEventListener('click', function(event) {
        debugger;
        shipId = event.target.id;
        moreInfo = document.createElement("p");
        
        const request = new XMLHttpRequest();
        const requestUrl = `/ships/${shipId}`;
        request.open('GET', requestUrl);
        request.responseType = 'json';
        request.send();
        request.onload = function() {
            let ship = new Ship(request.response);
            moreInfo.innerHTML = ship.name;
            shipLI.appendChild(moreInfo);
        };
    });
};