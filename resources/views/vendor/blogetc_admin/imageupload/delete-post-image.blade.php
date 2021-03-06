@extends('blogetc_admin::layouts.admin_layout')
@section('blog')
    <p>Are you sure you want to delete the featured image for the selected post?</p>

    <form method="post" action="{{ route('admin.blogetc.admin.images.delete-post-image-confirmed', $postId) }}">
        @method('DELETE')
        @csrf
        <input type="submit" value="Delete the images" class="btn btn-danger" />
    </form>
@endsection
