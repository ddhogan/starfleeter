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
    let shipUl = document.createElement("ul");
    shipUl.setAttribute("id", "shipList");
    let content = document.querySelector(".content");
    content.appendChild(shipUl);

    const requestUrl = "/ships";
    const request = new XMLHttpRequest();

    request.open('GET', requestUrl);
    request.responseType = 'json';
    request.send();
    request.onload = function() {
        request.response.forEach(function(item) {
            let ship = new Ship(item);
            let shipLi = document.createElement("li");
            shipLi.textContent = ship.name;
            shipUl.appendChild(shipLi);
        });
    };
};