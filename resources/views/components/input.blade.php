@props(['disabled' => false])

<input {{ $disabled ? 'disabled' : '' }} {!! $attributes->merge(['class' => 'bg-gray-100 rounded-md focus:outline-none focus:border-none focus:ring-0 outline-none border-none text-xs text-gray-800 h-9 placeholder:text-gray-400']) !!}>
