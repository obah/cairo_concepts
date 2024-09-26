#[derive(Drop, Debug)]
enum Direction {
    North: u32,
    West: u32,
    East: u32,
    South: u32
}

#[derive(Drop)]
enum Message {
    Quit,
    Echo: ByteArray,
    Move: (u32, u32)
}

#[derive(Drop)]
enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter: UsState
}

#[derive(Drop, Debug)]
enum UsState {
    California,
    Texas,
    NewYork
}

trait MessageTrait {
    fn process(self: Message);
}

impl MessageImpl of MessageTrait {
    fn process(self: Message) {
        match self {
            Message::Quit => { println!("Quitting") },
            Message::Echo(value) => { println!("{value}!") },
            Message::Move((x, y)) => { println!("moving from {x} to {y}") }
        }
    }
}

fn main() {
    let direction = Direction::South(30);

    println!("current direction is: {:?}", direction);

    let msg = Message::Move((10, 500));
    msg.process();

    let value = get_coin_value(Coin::Nickel);

    println!("value of the coin is {value}");

    get_coin_value(Coin::Quarter(UsState::California));

    let five: Option<u8> = Option::Some(5);
    println!("{:?}", plus_one(five));
    println!("{:?}", plus_one(Option::None));

    let mut arr = array![1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    sum_all(arr);
}

fn find_value_recursive(mut arr: Span<felt252>, value: felt252, index: u32) -> Option<u32> {
    match arr.pop_front() {
        Option::Some(index_value) => { if (*index_value == value) {
            return Option::Some(index);
        } },
        Option::None => { return Option::None; },
    };

    find_value_recursive(arr, value, index + 1)
}

fn find_value_iterative(mut arr: Span<felt252>, value: felt252, index: u32) -> Option<u32> {
    let mut result = Option::None;
    let mut index = 0;

    while let Option::Some(array_value) = arr.pop_front() {
        if (*array_value == value) {
            result = Option::Some(index);
            break;
        };

        index += 1;
    };

    result
}

fn get_coin_value(coin: Coin) -> felt252 {
    match coin {
        Coin::Penny => 1,
        Coin::Nickel => {
            println!("one nick a day");
            5
        },
        Coin::Dime => 10,
        Coin::Quarter(state) => {
            println!("Quarter from {:?}", state);
            25
        }
    }
}

fn plus_one(x: Option<u8>) -> Option<u8> {
    match x {
        Option::Some(val) => Option::Some(val + 1),
        Option::None => Option::None
    }
}

// fn sum_all(mut arr1: Span<u64>) {
fn sum_all(mut arr: Array<felt252>) {
    let mut sum = 0;

    while let Option::Some(value) = arr.pop_front() {
        sum += value;
    };
    println!("sum of the array is: {sum}");
}
