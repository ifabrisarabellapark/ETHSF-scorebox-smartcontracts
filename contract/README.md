# Hello NEAR Contract

The smart contract exposes two methods to enable storing and retrieving a greeting in the NEAR network.

```rust
const DEFAULT_MESSAGE: &str = "Hello";

#[near_bindgen]
#[derive(BorshDeserialize, BorshSerialize)]
pub struct Contract {
    greeting: String,
}

impl Default for Contract {
    fn default() -> Self {
        Self{greeting: DEFAULT_MESSAGE.to_string()}
    }
}

#[near_bindgen]
impl Contract {
    // Public: Returns the stored greeting, defaulting to 'Hello'
    pub fn get_greeting(&self) -> String {
        return self.greeting.clone();
    }

    // Public: Takes a greeting, such as 'howdy', and records it
    pub fn set_greeting(&mut self, greeting: String) {
        // Record a log permanently to the blockchain!
        log!("Saving greeting {}", greeting);
        self.greeting = greeting;
    }
}
```

<br />

# Quickstart
WIP

```bash
rustup target add wasm32-unknown-unknown
```