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
		url: 'http://localhost:3000/lists',
		method: 'get',
		dataType: 'json',
		success: function (data) {
			console.log("the data is: ", data) //need to learn how to process the data i retrieved from the api call so its not undefined.
			data.forEach(list => {
				const newlist = new List(list)
				const newListHtml = newlist.listHTML()
				document.getElementById('js-lists').innerHTML = newListHtml
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
	constructor(id, title) {
		this.id = id
		this.title = title
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

List.prototype.listHTML = function () {
	// (list => {
	// 	return (`
	// 		<p>${this.title}</p>
	// 	`)
	// })

	return (`
		<div class='list'>
			<h3>${this.title}</h3>
		</div>
	`)
 }
