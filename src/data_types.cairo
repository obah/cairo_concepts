#[derive(Drop)]
struct UserDetails {
    name: ByteArray,
    age: u8,
    isActive: bool,
    count: u32
}

fn main() {
    //different ways of creating and using tuples
    // let tuple0: (u32, i32, bool, felt252) = (100, -100, false, 10);
    // let (x, y): (u8, u32) = (2,99)
    //tuples
    let tuple1 = (100, 32, true, 'false');
    //destructuring is used here
    let (_, _, y, _) = tuple1;
    println!("value of y is {}", y);

    //arrays
    // let arr1: [u32; 10] = [1,2,3,4,5,6,7,8,9,0];
    // let arr2 = [10; 5]; //this is equal to [10,10,10,10,10];
    //array destructuring
    let arr3 = [1, 2, 3, 4, 5];
    let [_, b, _, _, _] = arr3;
    println!("value of b is {}", b);
    let span_array = arr3.span();
    println!("indexing has now been added to our array");
    println!("span_array[1] is equal to: {}", span_array[1]);

    //type conversions
    let var1_u8: u8 = 10;
    let var2_u16: u16 = var1_u8.into();
    let var3_felt: felt252 = var2_u16.into();
    let var4_u256: u256 = var3_felt.into();
    let var5_felt: felt252 = var4_u256.try_into().unwrap();
    println!("{var5_felt}");

    let user1 = build_user("oba", 18);
    let user2 = UserDetails { count: 10, ..user1 };
    println!("{}", user2.name)
}

fn build_user(name: ByteArray, age: u8) -> UserDetails {
    UserDetails { name, age, isActive: false, count: 3 }
}
