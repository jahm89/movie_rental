
<template>
    <div>
        <h2>Form new movie</h2>
        <form @submit.prevent="postCreateMovie">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Name" v-model="movie.name">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Title" v-model="movie.title">
            </div>
            <div class="form-group">
                <textarea class="form-control" placeholder="Description" v-model="movie.description"></textarea>
            </div>
            <div class="form-group">
                <input type="number" class="form-control" placeholder="Stock" v-model="movie.stock">
            </div>
            <div class="form-group">
                <input type="number" class="form-control" placeholder="Rental price $" v-model="movie.rental_price">
            </div>
            <div class="form-group">
                <input type="number" class="form-control" placeholder="Sale price $" v-model="movie.sale_price">
            </div>
            <div class="form-group">
                <input type="number" class="form-control" placeholder="Monetary penalty(rental) $" v-model="movie.monetary_penalty">
            </div>
            <div class="form-group">
                <select class="form-control" v-model="movie.availability">
                    <option value="1">Available</option>
                    <option value="0">Not available</option>
                </select>
            </div>
            <div class="form-group">
                <label class="form-control">Image</label>
                <input class="form-control" type="file" v-on:change="uploadImage" ref="fileInput">
            </div>
            <button type="submit" class="btn btn-success">Save</button>
        </form>
   </div>
</template>

<script>
    export default {
        data() {
            return {
                files: [],
                movie: {
                    name: '',
                    title: '',
                    description: '',
                    stock: '',
                    rental_price: '',
                    sale_price: '',
                    availability: '',
                    monetary_penalty: '',
                    image: ''
                }
            };
        },
 
        created() {
        },
 
        methods: {
            postCreateMovie(api_url) {
                api_url = "/movie_rental/api/movies";
                this.movie.image = this.previewImage;
                this.movie.token = localStorage.getItem('user-token')
                fetch(api_url, {
                    method: 'post',
                    body: JSON.stringify(this.movie),
                    headers: {
                        'content-type': 'application/json'
                    }
                })
                    .then(response => response.json())
                    .then(response => {
                        
                    })
                    .catch(err => console.log(err));
            },
            uploadImage(e){
                const image = e.target.files[0];
                const reader = new FileReader();
                reader.readAsDataURL(image);
                reader.onload = e =>{
                    this.previewImage = e.target.result;
                };
            }
        }
    };
</script>