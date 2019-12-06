<template>
    <div>
        <nav>
            <ul class="pagination justify-content-center">
                <li v-bind:class="[{disabled: !pagination.prev_page_url}]" class="page-item">
                    <a class="page-link" href="#" @click="getMovies(pagination.prev_page_url)">Previous</a>
                </li>
                <li class="page-item disabled">
                    <a class="page-link" href="#">{{ pagination.current_page }} of {{ pagination.last_page }}</a>
                </li>
                <li v-bind:class="[{disabled: !pagination.next_page_url}]" class="page-item">
                    <a class="page-link" href="#" @click="getMovies(pagination.next_page_url)">Next</a>
                </li>
            </ul>
        </nav>

        <div class="card mb-2" v-for="movie in movies" v-bind:key="movie.id">
            <div class="card-body ">
                <h4 class="card-title">{{ movie.title }}</h4>
                <img v-bind:src="`${imgPreUrl(movie.id)}`">
                <p class="card-text">{{ movie.description }}</p>
                <p class="card-text">Rental Price: {{ movie.rental_price }}</p>
                <p class="card-text">Sale Price: {{ movie.sale_price }}</p>
                <p class="card-text">Likes: {{ movie.likes }}</p>
            </div>
        </div>
        <br>
    </div>
</template>
 
<script>
    export default {
        data() {
            return {
                movies: [],
                images: [],
                pagination: {},
                movie: {
                    id: '',
                    name: '',
                    title: '',
                    description: '',
                    stock: '',
                    rental_price: '',
                    sale_price: '',
                    availability: '',
                    monetary_penalty: ''
                }
            };
        },
 
        created() {
            this.getMovies();
        },
 
        methods: {
            getMovies(api_url) {
                let vm = this;
                api_url = api_url || '/movie_rental/api/movies';
                fetch(api_url)
                    .then(response => response.json())
                    .then(response => {
                        this.movies = response.data.data;
                        this.images = response.images;
                        vm.paginator(response.data.current_page,
                                    response.data.last_page, response.data.next_page_url, 
                                    response.data.prev_page_url);
                    })
                    .catch(err => console.log(err));
            },
             paginator(current_page,last_page, next, prev) {
                this.pagination = {
                    current_page: current_page,
                    last_page: last_page,
                    next_page_url: next,
                    prev_page_url: prev
                };
            },
            imgPreUrl(id) {
                if (typeof this.images[id] !== undefined) 
                    return "/movie_rental/images/"+this.images[id];
                else
                    return "";
            }
        }
    };
</script>