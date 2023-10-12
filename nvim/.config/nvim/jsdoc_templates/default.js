module.exports = {
  generateClassDoc: (doc) => {
    return `/** ${doc.name} */`
  },
  generateInterfaceDoc: (doc) => {
    return `// ${doc.name}`
  },
  generateFunctionDoc: (doc) => {
    return `/**\n * ${doc.name}\n *\n * @author Ramon Bakker <rbakker@ilionx.com>\n */`
  },
}
