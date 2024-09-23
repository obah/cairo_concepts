#[derive(Copy, Drop)]
enum NewEnum {
    First: u32,
    Second: ByteArray,
    Third: (u32, i128),
}

fn main() {
    let mut arr1 = ArrayTrait::<u32>::new();

    arr1.append(1);
    arr1.append(2);
    arr1.append(3);
    arr1.append(4);
    arr1.append(5);

    let arr2 = arr1.span();

    // let arr2 = arr1.span();
    let value1: u32 = arr1.pop_front().unwrap();
    // let value2 = arr1.get(1);

    println!("length of the array is now: {value1}");
    println!("{}", arr2[3]);

    println!("=================================================================");
    let mut arr_length = arr1.len();

    println!("length of array is now: {}", arr_length);

    arr1.append(56);

    arr_length = arr1.len();

    println!("length of array is now: {}", arr_length);
    // let index = 1;

    // match arr1.get(index) {
    //     Option::Some(x) => {
    //         *x.unbox()
    //     },
    //     Option::None => {panic!("panicked")}
    // }

    let mut arr3 = array![4, 5];
    let arr3_2nd = arr3[1];
    arr3.append(3);
    println!("{arr3_2nd}");
    let arr3_len = arr3.len();
    println!("{arr3_len}");

    println!("=================================ENUM===========================");
    //this is like struct in solidity

    let mut arr4: Array<NewEnum> = array![];

    arr4.append(NewEnum::First(2));
    arr4.append(NewEnum::Second("hello world"));
    arr4.append(NewEnum::Third((23, 566)));
}
