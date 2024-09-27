use core::panic_with_felt252;

//this fails because it can panic
// fn test1() nopanic {
//     assert(1 == 1, 'didnt panic');
// }

fn test2() -> u8 nopanic {
    43
}

#[panic_with('value is 0', wrap_not_zero)]
fn wrap_if_not_zero(value: u128) -> Option<u128> {
    if value == 0 {
        Option::None
    } else {
        Option::Some(value)
    }
}

fn main() {
    // let data: Array<felt252> = array![8];

    wrap_if_not_zero(0);
    wrap_not_zero(0);

    if true {
        // panic(data);
        // panic_with_felt252(1);
        panic!("code panicked");
    }

    println!("code not reached");
}
