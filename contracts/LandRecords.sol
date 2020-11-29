// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

contract LandRecords{
uint countproperties = 0;

address admin;

constructor() public{
    admin = msg.sender;
}

struct property{
    string use;
    uint cost;
    // mapping (address=>bool) owners;
    address currentOwner;
}

// mapping(uint=>uint[] memory)) propertytolistofowners;
mapping(uint=>property)  propertylist;

event propertycreated(string use,uint cost, address currentOwner);

event propertydetails(string use,uint cost, address currentOwner);

event propertytransferred(uint id, address currentOwner);

// admin is the one who approves the sale of property
modifier isadmin()
{require(msg.sender == admin);
    _;
}

// sellerOwnsproperty checks whether the person selling the property is the actual owner
modifier sellerOwnsproperty( uint id,address seller)
{require(seller== propertylist[id].currentOwner);
    _;
}


function createProperty(string memory use,uint cost, address currentOwner) public
{
    countproperties++;
    propertylist[countproperties] = property(use, cost,currentOwner);
    // propertytolistofowners[countproperties]
   
   
    // emit propertydetails(propertylist[countproperties].use,propertylist[countproperties].cost, propertylist[countproperties].currentOwner);

}

function getPropertyDetails(uint id) public view returns (string memory,uint,address)
{
// emit propertydetails(propertylist[id].use,propertylist[id].cost, propertylist[id].currentOwner);
return (propertylist[id].use,propertylist[id].cost, propertylist[id].currentOwner);
}

function transferProperty(uint id, address newOwner, address seller) sellerOwnsproperty(id,seller) isadmin() public
{
    propertylist[id].currentOwner =  newOwner;
    emit propertytransferred(id, propertylist[id].currentOwner);
}



}
