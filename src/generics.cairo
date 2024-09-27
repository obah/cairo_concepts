#[derive(Copy, Drop)]
struct Wallet<T> {
    balance: T,
}

trait WalletTrait<T> {
    fn get_balance(self: @Wallet<T>) -> T;
}

impl WalletImpl<T, +Copy<T>> of WalletTrait<T> {
    fn get_balance(self: @Wallet<T>) -> T {
        return *self.balance;
    }
}

//trait for u128 replacing T
trait WalletReceiveTrait {
    fn receive(ref self: Wallet<u128>, value: u128);
}

impl WalletReceiveImpl of WalletReceiveTrait {
    fn receive(ref self: Wallet<u128>, value: u128) {
        self.balance += value;
    }
}

fn get_largest_array<T, impl TDrop: Drop<T>>(arr1: Array<T>, arr2: Array<T>) -> Array<T> {
    if arr1.len() > arr2.len() {
        arr1
    } else {
        arr2
    }
}

fn get_smallest_element<T, +PartialOrd<T>, +Copy<T>, +Drop<T>>(arr: @Array<T>) -> T {
    let mut smallest = *arr[0];
    let mut index = 1;

    while index <= arr.len() {
        if smallest < *arr[index] {
            smallest = *arr[index];
        }
        index += 1;
    };

    smallest
}

fn main() {
    let arr1 = array![1, 2, 3];
    let arr2 = array![4, 5];

    let arr3 = get_largest_array(arr1, arr2);
    println!("longest array has length: {}", arr3.len());

    // let val1 = get_smallest_element(@arr3);
    // println!("small value in the longest array is {val1}");

    let mut wallet1 = Wallet { balance: 100 };
    let mut balance = wallet1.get_balance();
    assert!(balance == 100, "balance isnt 100");

    wallet1.receive(50);
    balance = wallet1.get_balance();
    println!("new balance in the wallet is: {:?}", balance);
    // wallet1
}
//generics can also be done with structs and enums same way


