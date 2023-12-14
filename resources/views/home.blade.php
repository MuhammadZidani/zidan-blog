<x-app-layout>

    @section('hero')
    <div class="w-full text-center">
        <div class="bg-[url('https:source.unsplash.com/1450x600?fashion+bisnisfashion')] w-full py-56">
            <h1 class="text-2xl md:text-3xl font-bold text-center lg:text-5xl text-gray-900">
                Welcome to <span class="text-yellow-500">Fashion</span> <span class="text-gray-900">Blog Latest</span>
            </h1>
            <p class="text-white text-lg mt-1">Best Blog in the universe</p>
            <a class="px-4 py-2 text-lg text-white bg-gray-900 rounded-full mt-3 inline-block"
                href="{{ route('posts.index') }}">Start
                Reading</a>
        </div>
    </div>
    @endsection

    <div class="mb-10 w-full">
        <div class="mb-16">
            <h2 class="mt-16 mb-5 text-3xl text-gray-900 font-bold">Featured Posts</h2>
            <div class="w-full">
                <div class="grid grid-cols-3 gap-10 w-full">
                    @foreach ($featuredPosts as $post)
                            <x-post.post-card :post="$post" class="md:col-span-1 col-span-3" />
                    @endforeach
                </div>
            </div>
            <a class="mt-10 block text-center text-lg text-yellow-500 font-semibold"
                href="http://127.0.0.1:8000/blog">More
                Posts</a>
        </div>
        <hr>

        <h2 class="mt-16 mb-5 text-3xl text-gray-900 font-bold">Latest Posts</h2>
        <div class="w-full mb-5">
            <div class="grid grid-cols-3 gap-10 w-full">
                @foreach ($latestPosts as $post)
                    <div class="md:col-span-1 col-span-3">
                        <x-post.post-card :post="$post" />
                    </div>
                @endforeach
            </div>
        </div>
        <a class="mt-10 block text-center text-lg text-yellow-500 font-semibold"
            href="http://127.0.0.1:8000/blog">More
            Posts</a>
    </div>

</x-app-layout>