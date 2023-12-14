@props(['category'])
<x-budge
     wire:navigate href="{{ route('posts.index', ['category' => $category->slug]) }}" 
    :textColor="$category->text_color" :bgColor="$category->bg_color">
    {{ $category->title }}
</x-budge>