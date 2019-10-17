$(function () {
	console.log('posts.js is loaded ...')
	listenForClick()
	listenForNewListFormClick()
});

function listenForClick() {
	$('button#lists-data').on('click', function (event) {
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
			console.log("the data is: ", data) //need to learn how to process the data i retrieved from the api call so its not undefined.
			data.forEach(function(list) {
				let newlist = new List(list)
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


class List {
	constructor(obj) {
		this.id = obj.id
		this.title = obj.title
		this.items = obj.list_items
	}

  static newListForm() {
  return (`
  <strong>New list form</strong>
    <form>
      <input id='list-title' type='text' name='title'></input><br>
      <input type='submit' />
    </form>
  `)
 }
}

function createLi(items) {
	return `<li>${items.content} </li>`

}

List.prototype.listHTML = function() {

	let html = `
		<div class='list'>
			<h3>${this.title}</h3>
			<ul>
			   ${this.items.forEach(function(item) {
             createLi(item)
				 })}
			</ul>
		</div>	`

	$('#js-lists').append(html)
 }
