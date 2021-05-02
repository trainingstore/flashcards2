function checkSize() {
  const cardPicture = document.getElementById('card_picture')
  const sizeInMegabytes = cardPicture.files[0].size/1024/1024
  if (sizeInMegabytes > 6) {
    alert('Maximum file size is 6MB. Please choose a smaller file')
    cardPicture.value = ''
  }
}
