# install rustup 
curl https://sh.rustup.rs -sSf | sh

# get latest rust version
rustup install stable
rustup default stable

# enable emscripten (webassembly)
rustup target add wasm32-unknown-emscripten
