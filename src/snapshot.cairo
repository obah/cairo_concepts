fn main() {
    let mut arr1: Array<u32> = array![1, 2];
    let arr2 = @arr1;

    arr1.append(3);

    println!("length of original array is: {}", arr1.len());
    println!("length of snapshot array is: {}", arr2.len());
}
