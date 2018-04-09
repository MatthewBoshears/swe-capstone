//used for fetching data from Firebase
//and converting JSON to custom types

import Firebase
func fetchNodes() {
	let ref: DatabaseReference!
	ref = Database.database().reference()
    
    ref.child("Graph").child("Nodes").observeSingleEvent(of: .value, with: { (snapshot) in

        guard let dictionary = snapshot.value as? [String: [String: Any]] else {
            return
        }
       convertToNavigationLocations(from: dictionary)
    }) { (error) in
        print(error.localizedDescription)
    }
}

var arrayNodes: [NavigationLocation] = [NavigationLocation(lat: 0, lng: 0, name: "a", id: -1)] //global variable that is used to store values for parsing
//var edgeList: [string]
    //global variables that stores edges
func convertToNavigationLocations(from dict: [String: [String: Any]]) {
   var counter = 0
    for properties in dict.values {
        
        let id = properties["_id"] as! Int        
        let lat = properties["latitude"] as! Double
        let lng = properties["longitude"] as! Double
        let dsc = properties["description"] as! String
        let navLoc = NavigationLocation(lat: lat, lng: lng, name: dsc, id: id, indexID: counter)
        arrayNodes.append(navLoc)
        counter+=1
    }

}


func fetchNodes() {
    let ref: DatabaseReference!
    ref = Database.database().reference()
    
    ref.child("Graph").child("Edges").observeSingleEvent(of: .value, with: { (snapshot) in
        
        guard let dictionary = snapshot.value as? [String: [String: Any]] else {
            return
        }
       
    }) { (error) in
        print(error.localizedDescription)
    }
    
}
/*
func convertToEdgeValues( from dict: [String: [String: Any]]) {
    var counter = 0
    for strings in dict.values {
        edgeList.append(strings)
        //Add the "stairs" functionality
    }
}
 */

