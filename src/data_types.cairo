fn main() {
    // let tuple0: (u32, i32, bool, felt252) = (100, -100, false, 10);
    //tuples
    let tuple1 = (100, 32, true, 'false');
    //destructuring is used here
    let (w, x, y, z) = tuple1;
    println!("value of y is {}", y);

}