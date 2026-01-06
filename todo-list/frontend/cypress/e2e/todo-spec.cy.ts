describe('Todo Creation Spec', () => {
  it("Create User", () => {
    const newUserName: string = "New User";

    cy.visit("http://localhost:5173/users");
    cy.get('[name="new-username"]').type(newUserName);
    cy.get('[type="submit"]').click();
  });
  it("Create Todo", () => {
    const newTodoName: string = "Test Todo Name";
    const newTodoDescription: string = "Test Todo Description";

    cy.visit("http://localhost:5173");
    cy.get('[id="todoNameInput"]').type(newTodoName);
    cy.get('[id="descriptionInput"]').type(newTodoDescription);
    cy.get('[type="date"]').type('{upArrow}');
    cy.get('[name="user-selection"]').select(0);
    cy.get('[type="submit"]').click();

    cy.get('[name="name-input"]').should("contain.value", newTodoName);
    cy.get('[name="description-input"]').should("contain.value", newTodoDescription);
  });
});
