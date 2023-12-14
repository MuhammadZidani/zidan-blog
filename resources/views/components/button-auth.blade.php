<button {{ $attributes->merge(['type' => 'submit', 'class' => 'w-full bg-yellow-500 hover:bg-yellow-400 px-4 py-2 border border-transparent text-white font-semibold rounded-md']) }}>
    {{ $slot }}
</button>