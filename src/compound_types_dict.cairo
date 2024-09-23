use core::dict::Felt252Dict;
use core::nullable::{NullableTrait, match_nullable, FromNullableResult};

fn main() {
    //dictionairies are just mappings from solidity
    let mut balances: Felt252Dict<u32> = Default::default();

    balances.insert('oba', 100);
    balances.insert('todimu', 200);

    let oba_balance = balances.get('oba');
    assert!(oba_balance == 100, "balance is wrong");
    println!("{oba_balance}");

    balances.insert('oba', 300);

    let oba_balance2 = balances.get('oba');
    assert!(oba_balance2 >= 200, "balance is still wrong");

    println!("=========================using arrays/compounds in dictionary=====================");
    //new dictionary
    let mut d: Felt252Dict<Nullable<Span<felt252>>> = Default::default();

    //new array
    let a = array![8, 9, 10];

    //insert array into dictionary as span
    d.insert(0, NullableTrait::new(a.span()));

    //get the value back
    let val = d.get(0);

    //search the value and assert its not null
    let span = match match_nullable(val) {
        FromNullableResult::Null => panic!("No value found"),
        FromNullableResult::NotNull(val) => val.unbox(),
    };

    //verify right values
    assert!(*span.at(0) == 8, "Expecting 8");
    assert!(*span.at(1) == 9, "Expecting 9");
    assert!(*span.at(2) == 10, "Expecting 10");
}
