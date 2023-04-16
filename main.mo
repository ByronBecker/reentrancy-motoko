shared ({ caller = creator }) actor class Reentrancy() {

  var i = 0;
  var status: { #not_started; #started; #complete } = #not_started;

  public shared func test() : async Text {

    let i0 = i;
    
    if (status == #complete) {
      return "already complete";
    };

    i += 1;

    if (status == #not_started) {
      status := #started;
      await foo();
      status := #complete;
    };

    return "i0 = " # debug_show i0 # ", i = " # debug_show i;
  };

  private func foo() : async () {
    ()
  };

};
