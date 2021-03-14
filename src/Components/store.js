var redux = require ('redux')
const noteInitialState = {
    editItem:{}
}
const allReducer = (state = noteInitialState, action) => {
    switch (action.type) {
        case "GET_EDIT_DATA":
            return {...state,editItem:action.editObject}
      
    }
}
var store = redux.createStore(allReducer)
store.subscribe(function(){
    console.log(JSON.stringify(store.getState()));
    
})
export default store