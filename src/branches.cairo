fn if_blocks() {
    let num: u32 = 1;

    if num == 10 {
        println!("num is 10");
    } else if num == 9 {
        println!("num is 9");
    } else {
        println!("you didnt find num");
    }
    //using presence of value in num as bool wont work

    //if can also be used in let statements becuase they are if is an expression
    let val1: bool = true;

    let val2: u8 = if val1 {
        5
    } else {
        6
    };
    println!("val2 is {val2}");
}

fn loops() -> u32 {
    // loop {
    //     println!("loop running!");
    // }

    // let mut count: u32 = 0;

    // loop {
    //     if count >= 10 {
    //         break;
    //     }
    //     if count == 5 {
    //         count += 1;
    //         continue;
    //     }
    //     println!("count is currently: {count}");
    //     count += 1;
    // };

    let mut count2: u32 = 0;

    loop {
        if count2 == 10 {
            break count2 * 2;
        }
        count2 += 2;
    }
}

fn while_loop() {
    let mut count: u32 = 10;
    while count != 0 {
        println!("while loop counter is currently {count}");
        count -= 1;
    };

    //using while to loop over an array, done better with for loop
    let arr1: [ByteArray; 3] = ["hello", "world", "oba"];
    let indexedArray = arr1.span();
    let mut i: u32 = 0;
    let arrLength: u32 = indexedArray.len();

    println!("length of the indexed array is {arrLength}");

    while i < arrLength {
        println!("current value of arr1 at index {i} is: {}", indexedArray[i]);
        i += 1;
    }
}

fn for_loop() {
    //this is a safer and efficient method to loop over a collection of items
    let arr2: [ByteArray; 5] = ["segun", "oba", "onye", "jerry", "simon"];
    let indexedArray = arr2.span();
    for i in indexedArray {
        println!("current roommate is: {i}");
    };

    //using range
    println!("in ...");
    for i in 1..4_u8 {
        println!("{i}");
    };
    println!("take off!");
}

fn main() {
    // if_blocks();

    let var1 = loops();

    println!("loop returned is: {var1}");

    while_loop();

    for_loop();
}
