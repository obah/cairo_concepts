fn print_values(val1: u32, val2: ByteArray) {
    println!("values to print are {val1} and {val2}");
}

fn ten() -> u8 {
    10 //this is also a return statement, ; makes it not
}

fn plus_two(x: u32) -> u64 {
    x.into() + 2
}

fn main() {
    let x = 10;
    let y = "Ten";
    print_values(val1: x, val2: y);

    let val1 = 2;
    let val2: ByteArray = "Two";
    print_values(:val1, :val2);
    // print_values(10, "ten");

    let a = {
        let b = 3;
        b + b
    };

    println!("value of a is: {}", a);

    let ten = ten();
    println!("the ten function returns: {}", ten);
}
