<div class="card mt-2">
    <div class="card-body">
        <div class="form-group mt-1">
            <label for="blog_title">Blog Post Title</label>
            <input type="text" class="form-control" required id="blog_title" aria-describedby="blog_title_help"
                name="title" value="{{old("title",$post->title)}}">
            <small id="blog_title_help" class="form-text text-muted">The title of the blog post</small>
        </div>

        <div class="form-group mt-1">
            <label for="blog_subtitle">Subtitle</label>
            <input type="text" class="form-control" id="blog_subtitle" aria-describedby="blog_subtitle_help"
                name="subtitle" value="{{old("subtitle",$post->subtitle)}}">
            <small id="blog_subtitle_help" class="form-text text-muted">The subtitle of the blog post (optional)</small>
        </div>

        <div class="row">
            <div class="col-sm-12 col-md-4">
                <div class="form-group mt-1">
                    <label for="blog_slug">Blog Post Slug</label>
                    <input type="text" class="form-control" id="blog_slug" aria-describedby="blog_slug_help" name="slug"
                        value="{{old("slug",$post->slug)}}">
                    <small id="blog_slug_help" class="form-text text-muted">The slug (leave blank to auto generate) -
                        i.e. {{ route("blogetc.single", "" )}}/<u><em>this_part</em></u></small>
                </div>

            </div>
            <div class="col-sm-6 col-md-4">
                <div class="form-group mt-1">
                    <label for="blog_is_published">Published?</label>

                    <select name="is_published" class="form-control" id="blog_is_published"
                        aria-describedby="blog_is_published_help">

                        <option @if(old("is_published",$post->is_published) == '1') selected="selected" @endif
                            value="1">
                            Published
                        </option>
                        <option @if(old("is_published",$post->is_published) == '0') selected="selected" @endif
                            value="0">
                            Not Published
                        </option>

                    </select>
                    <small id="blog_is_published_help" class="form-text text-muted">
                        Should this be published? If not, then it won't be publicly viewable.
                    </small>
                </div>

            </div>
            <div class="col-sm-6 col-md-4">
                <div class="form-group mt-1">
                    <label for="blog_posted_at">Posted at</label>
                    <input type="text" class="form-control" id="blog_posted_at" aria-describedby="blog_posted_at_help"
                        name="posted_at" value="{{old("posted_at",$post->posted_at ?? \Carbon\Carbon::now())}}">
                    <small id="blog_posted_at_help" class="form-text text-muted">
                        When this should be published. If this value is greater than now ({{\Carbon\Carbon::now()}})
                        then it will not (yet) appear on your blog. Should be in the <code>YYYY-MM-DD HH:MM:SS</code>
                        format.
                    </small>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card mt-2">
    <div class="card-header">
        <label for="blog_post_body">Post Body
            @if(config("blogetc.echo_html"))
            (HTML)
            @else
            (Html will be escaped)
            @endif

        </label>
    </div>
    <div class="card-body">
        <div class="form-group mt-1">

            <textarea style="min-height:600px;" class="form-control" id="blog_post_body"
                aria-describedby="blog_post_body_help" name="post_body">{{old("post_body",$post->post_body)}}</textarea>

            <div class="alert alert-danger">
                Please note that any HTML (including any JS code) that is entered here will be
                echoed (without escaping)
            </div>
        </div>
    </div>
</div>

<div class="card mt-2">
    <div class="card-body">
        @if(config("blogetc.use_custom_view_files",true))
        <div class="form-group mt-1">
            <label for="blog_use_view_file">Custom View File</label>
            <input type="text" class="form-control" id="blog_use_view_file" aria-describedby="blog_use_view_file_help"
                name="use_view_file" value="{{old("use_view_file",$post->use_view_file)}}">
            <small id="blog_use_view_file_help" class="form-text text-muted">
                Optional - if anything is entered here, then it will attempt to load
                <code>view("custom_blog_posts." . $use_view_file)</code>. You must create the file in
                <code>/resources/views/custom_blog_posts/FILENAME.blade.php</code>.
            </small>
        </div>
        @endif

        <div class="form-group mt-1">
            <label for="blog_seo_title">SEO: {{"<title>"}} tag (optional)</label>
            <input class="form-control" id="blog_seo_title" aria-describedby="blog_seo_title_help" name="seo_title"
                type="text" value="{{ old("seo_title",$post->seo_title) }}">
            <small id="blog_seo_title_help" class="form-text text-muted">Enter a value for the {{"<title>"}} tag. If
                nothing is
                provided here we will just use the normal post title from above (optional)</small>
        </div>

        <div class="form-group mt-1">
            <label for="blog_meta_desc">Meta Desc (optional)</label>
            <textarea class="form-control" id="blog_meta_desc" aria-describedby="blog_meta_desc_help"
                name="meta_desc">{{old("meta_desc",$post->meta_desc)}}</textarea>
            <small id="blog_meta_desc_help" class="form-text text-muted">Meta description (optional)</small>
        </div>

        <div class="form-group mt-1">
            <label for="blog_short_description">Short Desc (optional)</label>
            <textarea class="form-control" id="blog_short_description" aria-describedby="blog_short_description_help"
                name="short_description">{{old("short_description",$post->short_description)}}</textarea>
            <small id="blog_short_description_help" class="form-text text-muted">Short description (optional - only
                useful if
                you use in your template views)</small>
        </div>
    </div>
</div>

@if(config("blogetc.image_upload_enabled",true))
<div class="card">
    <style>
        .image_upload_other_sizes {
            display: none;
        }
    </style>

    <div class="card-header">Featured Images</div>
    <div class="card-body">

        @php
        // TODO - put this logic in controller
        $hasImage = false; @endphp
        @foreach(config("blogetc.image_sizes") as $imageSizeKey =>$imageSizeAttributes)
        <div class="form-group p-2 {{ $loop->iteration > 1 ? 'image_upload_other_sizes' : '' }}">
            @if($post->hasImage($imageSizeAttributes['basic_key']))
            @php $hasImage = true; @endphp
            <div style="max-width:55px;" class="float-right m-2">
                <a style="cursor: zoom-in;" target="_blank"
                    href="{{$post->image_url($imageSizeAttributes['basic_key'])}}">
                    {!! $post->imageTag($imageSizeAttributes['basic_key'], false, 'd-block mx-auto img-fluid ') !!}
                </a>
            </div>
            @endif

            <label for="blog_{{$imageSizeKey}}">Image - {{$imageSizeAttributes['name']}} (optional)</label>
            <small id="blog_{{$imageSizeKey}}_help" class="form-text text-muted">
                Upload {{$imageSizeAttributes['name']}} image -
                <code>{{$imageSizeAttributes['w']}}&times;{{$imageSizeAttributes['h']}}px</code> - it will
                get automatically resized if larger
            </small>
            <input class="form-control" type="file" name="{{$imageSizeKey}}" id="blog_{{$imageSizeKey}}"
                aria-describedby="blog_{{$imageSizeKey}}_help">

            @if($hasImage)
            <a href="{{route('admin.blogetc.admin.images.delete-post-image', $post)}}" class="mt-1 btn btn-sm btn-danger"
                target="_blank">Delete images</a>
            @endif
        </div>
        @endforeach

        <p>
            By default it will resize for all images based on the first image. If you want to select specific images for
            each size, please click:
            <span class="btn btn-light btn-sm"
                onclick='$(this).parent().hide(); $(".image_upload_other_sizes").slideDown()'>
                Show other sizes
            </span>
        </p>

    </div>
    @else
    <div class="alert alert-warning">Image uploads were disabled in blogetc.php config</div>
</div>
@endif
</div>
<div class="card">
    <div class="card-header">Categories</div>
    <div class="card-body">
        @forelse(\WebDevEtc\BlogEtc\Models\Category::orderBy("category_name","asc")->limit(1000)->get() as $category)
        <div class="form-check col-sm-6">
            <input type="checkbox" value="1" @if(old("category.".$category->id,
            $post->categories->contains($category->id))) checked="checked"
            @endif name="category[{{$category->id}}]" id="category_check{{$category->id}}">
            <label class="form-check-label" for="category_check{{$category->id}}">
                {{$category->category_name}}
            </label>
        </div>
        @empty
        <div class="col-md-12">
            No categories
        </div>
        @endforelse

        <div class="col-md-12 my-3 text-center">

            <em>
                <a class="btn btn-primary" target="_blank"
                    href="{{route("admin.blogetc.admin.categories.create_category")}}">
                    <i class="bi bi-box-arrow-up-right" aria-hidden="true"></i>
                    Add new categories here
                </a>
            </em>
        </div>
    </div>
    @section('page-script')
    <script src="//js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
    <script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>
    @endsection
