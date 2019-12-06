@extends('layouts.app')

@section('content')
<div class="container">
    <input type="hidden" id="token-user" name="token-user" value="<?php echo $token ?>">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Movie List</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <movies-list></movies-list>

                    <?php if ($role == 'admin'): ?>
                        <new-movie></new-movie>
                    <?php endif ?>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
<script>
    window.onload = function(){
        localStorage.setItem('user-token', document.getElementById('token-user').value);
    }
</script>
