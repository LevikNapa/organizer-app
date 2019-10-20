$(function () {
	console.log('lists.js is loaded ...')
	listenForClick()
	listenForNewListFormClick()
});

function listenForClick() {
	$('button#lists-data').on('click', function(event) {
		event.preventDefault()
		getLists()
	})
}

function getLists() {
	$.ajax({
		url: 'http://localhost:3000/lists.json',
		method: 'get',
		data: 'json',
		success: function(data) {
			// console.log("the data is: ", data) //need to learn how to process the data i retrieved from the api call so its not undefined.
      $(".list").remove()
			data.forEach(function(list) {
				var newlist = new List(list)
        newlist.listHTML()
			})
		}
	})
}

function listenForNewListFormClick() {
	$('button#js-new-list').on('click', function (event) {
		event.preventDefault()
		let newListForm = List.newListForm()
		document.querySelector('div#new-list-form-div').innerHTML = newListForm
	})
}

// $("#new_list").on("submit", function(event){
// 	 event.preventDefault()
// 	 $.ajax({
// 		 method: "POST",
// 		 url: this.action
// 		 data: 'json',
// 		 success: function(data){
// 			 console.log('works')
//
// 			 var list = new List(data)
// 			 $('#list-div').append(list)
//
//
// 		 }
// 	 })
//  })


class List {
	constructor(obj) {
		this.id = obj.id
		this.title = obj.title
		this.list_items = obj.list_items
	}

  static newListForm() {
  return (`
  <strong>New list form</strong>
    <form id='list-form'>
      <input id='list-title' type='text' name='title'></input><br>
      <input type='submit' />
    </form>
  `)
 }
}

function createLi(list_items) {
    `<li>${list_items.content} </li>`

}

List.prototype.listHTML = function() {

	var html = `
		<div class='list'>
			<h3>${this.title}</h3>
			<ul>
			   ${this.list_items.forEach(function(item) {
             $('.list ul').append('<li>' + item.content + '</li>')
				 })}
				 </ul>
		</div>	`

	$('#js-lists').append(html)
 }
