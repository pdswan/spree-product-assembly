Product.class_eval do
  # spree 0.50.0 with devise 1.2rc2 loads this file twice
  # causing all sorts of havoc
  unless defined?(@_SPREE_PRODUCT_ASSEMBLY)
    @_SPREE_PRODUCT_ASSEMBLY = true

    has_and_belongs_to_many  :assemblies, :class_name => "Product",
          :join_table => "assemblies_parts",
          :foreign_key => "part_id", :association_foreign_key => "assembly_id"

    has_and_belongs_to_many  :parts, :class_name => "Variant",
          :join_table => "assemblies_parts",
          :foreign_key => "assembly_id", :association_foreign_key => "part_id"


    scope :individual_saled, where(["products.individual_sale = ?", true])

    scope :active, lambda { |*args|
      not_deleted.individual_saled.available(args.first)
    }

    alias_method :orig_on_hand, :on_hand
    # returns the number of inventory units "on_hand" for this product
    def on_hand
      if self.assembly? && Spree::Config[:track_inventory_levels]
        parts.map{|v| v.on_hand / self.count_of(v) }.min
      else
        self.orig_on_hand
      end
    end

    alias_method :orig_on_hand=, :on_hand=
    def on_hand=(new_level)
      self.orig_on_hand=(new_level) unless self.assembly?
    end

    alias_method :orig_has_stock?, :has_stock?
    def has_stock?
      if self.assembly? && Spree::Config[:track_inventory_levels]
        !parts.detect{|v| self.count_of(v) > v.on_hand}
      else
        self.orig_has_stock?
      end
    end

    def add_part(variant, count = 1)
      ap = AssembliesPart.get(self.id, variant.id)
      unless ap.nil?
        ap.count += count
        ap.save
      else
        self.parts << variant
        set_part_count(variant, count) if count > 1
      end
    end

    def remove_part(variant)
      ap = AssembliesPart.get(self.id, variant.id)
      unless ap.nil?
        ap.count -= 1
        if ap.count > 0
          ap.save
        else
          ap.destroy
        end
      end
    end

    def set_part_count(variant, count)
      ap = AssembliesPart.get(self.id, variant.id)
      unless ap.nil?
        if count > 0
          ap.count = count
          ap.save
        else
          ap.destroy
        end
      end
    end

    def assembly?
      parts.present?
    end

    def part?
      assemblies.present?
    end

    def count_of(variant)
      ap = AssembliesPart.get(self.id, variant.id)
      ap ? ap.count : 0
    end

  end
end
